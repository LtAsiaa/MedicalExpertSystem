package sample;

import javafx.fxml.FXML;
import javafx.fxml.Initializable;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.ListView;
import javafx.scene.layout.VBox;

import java.net.URL;
import java.util.ResourceBundle;

public class Controller implements Initializable {
    @FXML
    Label MainLabel;//, HistoryLabel;
    @FXML
    Button ButtReset;
    @FXML
    VBox ButtonsContainer;
    @FXML
    ListView HistoryList;
    @FXML
    VBox vbox1;

    @Override
    public void initialize(URL location, ResourceBundle resources) {
        //HistoryLabel.setText(movieResources.getString("History"));
        vbox1.setVisible(false);

    }
}
