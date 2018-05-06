import "fraction.js"          as Fraction
import "dataConstants.js"     as DataConstants
import "databaseFunctions.js" as DatabaseFunctions
import QtQuick 2.4
import QtQuick.LocalStorage 2.0
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3

MainView {
  id                             : main_view;
  objectName                     : 'mainView';

  // Note! applicationName needs to match the "name" field of click manifest
  applicationName                : 'cookingcalculator.jaft';

  /*
   *  This property enables the application to change orientation
   *  when the device is rotated. The default is false.
   */
  automaticOrientation           : true;

  width                          : units.gu(100);
  height                         : units.gu(75);
  property real   margs          : units.gu(2);

  property var    temps          : DataConstants.temps;
  property var    vols           : DataConstants.vols;
  property var    foods          : DataConstants.foods;
  property var    weights        : DataConstants.weights;
  property var    current_table  : vols;

  property var    fraction       : Fraction["Fraction"];

  PageHeader {
    id       : main_header;
    title    : i18n.tr("Cooking Calculator");
    extension: Sections {
                 id     : sects;
                 actions: [Action {
                             text       : i18n.tr("Products");
                             onTriggered: setupTabChange();
                           },
                           Action {
                             text       : i18n.tr("Temperatures");
                             onTriggered: setupTabChange();
                           },
                           Action {
                             text       : i18n.tr("Substitutions");
                             onTriggered: setupTabChange();
                           }]

                 anchors {
                   left      : parent.left;
                   leftMargin: margs;
                   bottom    : parent.bottom;
                 }
               }

    Label {
      anchors.centerIn: parent;
      text            : i18n.tr('Hello World!');
    }
  }
}
