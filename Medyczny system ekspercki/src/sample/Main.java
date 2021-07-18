package sample;

import javafx.application.Application;
import javafx.application.Platform;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Stage;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.*;
import java.util.List;

import CLIPSJNI.*;

public class Main extends Application {

    static Environment clips;
    static ResourceBundle medicResources;
    static Controller controller;
    static ArrayList<Button> buttons;
    static List<List<String>> assertedFacts;

    public static void main(String[] args) {
        buttons = new ArrayList<>();
        assertedFacts = new ArrayList<>();
        initClips();
        launch(args);
    }

    public static void run() {
        controller.MainLabel.setStyle("-fx-font-size: 30px");
        Runnable runThread = () -> {
            clips.run();
            Platform.runLater(() -> {
                try {
                    nextUIState();
                } catch (Exception ex) {
                    System.err.println("ex 11: " + ex.getMessage());
                }
            });
        };
        new Thread(runThread).start();

    }

    static void clicked(String who) throws Exception {
        String evalStr = "(find-all-facts ((?f state-list)) TRUE)";

        String currentID = clips.eval(evalStr).get(0).getFactSlot("current").toString();

        evalStr = "(find-all-facts ((?f UI-state)) " +
                "(eq ?f:id " + currentID + "))";

        PrimitiveValue fv = clips.eval(evalStr).get(0);

        try {
            clips.assertString("(next " + currentID + " " + who + " )");

            String content = medicResources.getString(fv.getFactSlot("display").symbolValue());
            if (content.length() > 44)
                content = content.substring(0, 40) + "...";
            assertedFacts.add(Arrays.asList(content, "(next " + currentID + " " + who + " )"));

        } catch (Exception ex) {
            System.err.println("ex 87: " + ex.getMessage());
        }
        run();
    }

    static void initClips() {
        assertedFacts.clear();

        try (FileInputStream fis = new FileInputStream("medic.properties")){
            try {
                medicResources = new PropertyResourceBundle((fis));
            } catch (IOException e) {
                e.printStackTrace();
            }
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        clips = new Environment();
        clips.load("medic.clp");
        clips.reset();
    }

    static private void nextUIState() throws Exception {
        buttons.clear();
        controller.ButtonsContainer.getChildren().clear();

        String evalStr = "(find-all-facts ((?f state-list)) TRUE)";

        String currentID = clips.eval(evalStr).get(0).getFactSlot("current").toString();

        evalStr = "(find-all-facts ((?f UI-state)) " +
                "(eq ?f:id " + currentID + "))";

        PrimitiveValue fv = clips.eval(evalStr).get(0);

        PrimitiveValue pv = fv.getFactSlot("valid-answers");

        for (int i = 0; i < pv.size(); i++) {
            Button b = new Button(medicResources.getString(pv.get(i).toString()));
            buttons.add(b);
            int finalI = i;
            buttons.get(i).setOnAction(event -> {
                try {
                    clicked(pv.get(finalI).toString());
                } catch (Exception ex) {
                    System.err.println("ex 33: " + ex.getMessage());
                }
            });
        }

        for (Button b : buttons) {
            controller.ButtonsContainer.getChildren().add(b);
        }

        controller.MainLabel.setText(medicResources.getString(fv.getFactSlot("display").symbolValue()));

        if (fv.getFactSlot("state").toString().equals("final")) {
            controller.MainLabel.setStyle("-fx-font-size: 22px");
        }
    }


    @Override
    public void start(Stage primaryStage) throws Exception {
        FXMLLoader fxmlLoader = new FXMLLoader();
        Parent root = fxmlLoader.load(getClass().getResource("sample.fxml").openStream());
        root.getStylesheets().add(getClass().getResource("style.css").toExternalForm());
        primaryStage.setTitle("Medyczny System Ekspertowy");
        primaryStage.setScene(new Scene(root));

        controller = fxmlLoader.getController();
        run();
        controller.ButtReset.setOnAction(event -> {
            initClips();
            run();
        });

        primaryStage.show();
        primaryStage.setResizable(false);
    }

}
