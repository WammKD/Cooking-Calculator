import "fraction.min.js" as Fraction
import QtQuick 2.4
import QtQuick.Layouts 1.1
import Ubuntu.Components 1.3

MainView {
  id                  : root;
  objectName          : 'mainView';

  // Note! applicationName needs to match the "name" field of click manifest
  applicationName     : 'cookingcalculator.jaft';

  /*
   *  This property enables the application to change orientation
   *  when the device is rotated. The default is false.
   */
  automaticOrientation: true;

  width              : units.gu(100);
  height             : units.gu(75);
  property real margs: units.gu(2);

  Page {
    anchors.fill: parent

    header: PageHeader {
              id   : header
              title: i18n.tr('Cooking Calculator')
            }

    Label {
      anchors.centerIn: parent
      text            : i18n.tr('Hello World!')
    }
  }
}
