import QtQuick 2.4
import Ubuntu.Components 1.3

Row {
  property int contact_label_width: contact_row.children[0].width;

  Label {
    text          : i18n.tr(row_key);
    color         : UbuntuColors.slate;
    width         : set_width ? contact_label_width : implicitWidth;
    lineHeight    : units.gu(2.5);
    lineHeightMode: Text.FixedHeight;
  }

  Label {
    text          : row_value;
    color         : UbuntuColors.inkstone;
    width         : parent.parent.width - contact_label_width;
    font.bold     : true;
    lineHeight    : units.gu(2.5);
    lineHeightMode: Text.FixedHeight;
    wrapMode      : Text.Wrap;
  }
}
