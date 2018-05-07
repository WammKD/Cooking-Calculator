import QtQuick 2.4
import Ubuntu.Components 1.3

Row {
  Label {
    text          : i18n.tr(row_key);
    color         : UbuntuColors.slate;
    width         : contact_label.width;
    lineHeight    : units.gu(2.5);
    lineHeightMode: Text.FixedHeight;
  }

  Label {
    text          : row_value;
    color         : UbuntuColors.inkstone;
    width         : parent.parent.width - contact_label.width;
    font.bold     : true;
    lineHeight    : units.gu(2.5);
    lineHeightMode: Text.FixedHeight;
    wrapMode      : Text.Wrap;
  }
}
