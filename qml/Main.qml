import "fraction.js"          as Fraction
import "dataConstants.js"     as DataConstants
import "databaseFunctions.js" as DatabaseFunctions
import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

MainView {
  id                              : main_view;
  objectName                      : 'mainView';

  // Note! applicationName needs to match the "name" field of click manifest
  applicationName                 : 'cookingcalculator.jaft';

  /*
   *  This property enables the application to change orientation
   *  when the device is rotated. The default is false.
   */
  automaticOrientation            : true;

  width                           : units.gu(100);
  height                          : units.gu(75);
  property real   margs           : units.gu(2);

  property var    temps           : DataConstants.temps;
  property var    vols            : DataConstants.vols;
  property var    foods           : DataConstants.foods;
  property var    weights         : DataConstants.weights;
  property var    current_table   : vols;
  property var    db              : DatabaseFunctions.openDB();
  property bool   settings_updated: false;

  property var    fraction        : Fraction["Fraction"];

  /*
   *  Settings
   */
  PageHeader {
    id                      : settings_header;
    title                   : i18n.tr("Settings");
    visible                 : false;
    leadingActionBar.actions: [Action {
                                 iconName   : "back";
                                 text       : "Back";
                                 onTriggered: {
                                   settings_header.visible = false;
                                       main_header.visible = true;

                                   if(settings_updated) {
                                     settings_updated = false;
                                     convert(false);
                                   }
                                 }
                               }]
  }

  /*
   *  Main
   */
  PageHeader {
    id       : main_header;
    title    : i18n.tr("Cooking Calculator");
    extension: Sections {
                 id     : sects;
                 actions: [Action {
                             text       : i18n.tr("Products");
                             onTriggered: console.log("PRODUCTS");
                           },
                           Action {
                             text       : i18n.tr("Temperatures");
                             onTriggered: console.log("TEMPERATURES");
                           },
                           Action {
                             text       : i18n.tr("Substitutions");
                             onTriggered: console.log("SUBSTITUTIONS");
                           }]

                 anchors {
                   left      : parent.left;
                   leftMargin: margs;
                   bottom    : parent.bottom;
                 }
               }

    trailingActionBar {
      actions: [Action {
                  iconName   : "settings";
                  text       : "Settings";
                  onTriggered: {
                        main_header.visible = false;
                    settings_header.visible = true;
                  }
                },
                Action {
                  iconName   : "info";
                  text       : "About";
                  onTriggered: PopupUtils.open(info_dialog);
                }]
    }

    Component {
      id: info_dialog;

      Popover {
        contentWidth : {  // GitHub URL length
          var  ideal_width = 824.1875 + contact_row.children[0].width + margs * 2;
          var device_width =                             parent.width - margs * 2;

          return ideal_width > device_width ? device_width : ideal_width;
        }
        contentHeight: info_dialogue.height + margs * 2;

        Column {
          id: info_dialogue;

          anchors {
            margins: margs;
            left   : parent.left;
            top    : parent.top;
            right  : parent.right;
          }

          Label {
            id                      : info_title;
            text                    : i18n.tr("About");
            color                   : UbuntuColors.slate;
            fontSize                : "x-large";
            anchors.horizontalCenter: parent.horizontalCenter;
          }

          AboutRow {
            property bool   set_width: true;
            property string row_key  : "\nAuthor:";
            property string row_value: "\nJonathan Schmeling";
          }

          AboutRow {
            id                       : contact_row;
            property bool   set_width: false;
            property string row_key  : "Contact:  ";
            property string row_value: "jaft.r@outlook.com";
          }

          AboutRow {
            property bool   set_width: true;
            property string row_key  : "Source:";
            property string row_value: "https://github.com/WammKD/Cooking-Calc";
          }

          AboutRow {
            property bool   set_width: true;
            property string row_key  : "Version:";
            property string row_value: "1.0.0";
          }

          AboutRow {
            property bool   set_width: true;
            property string row_key  : "Year:";
            property string row_value: "2018";
          }
        }
      }
    }

    Label {
      anchors.centerIn: parent;
      text            : i18n.tr('Hello World!');
    }
  }
}
