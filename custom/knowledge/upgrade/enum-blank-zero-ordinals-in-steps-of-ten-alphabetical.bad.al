enum 50271 "Sample Shipping Method Bad"
{
    Extensible = true;

    // No blank value at 0, ordinals in steps of 1, not alphabetical.
    value(0; Road) { Caption = 'Road'; }
    value(1; Air) { Caption = 'Air'; }
    value(2; Express) { Caption = 'Express'; } // Was Sea; renumbered to make room, so stored Sea rows now read as Express.
    value(3; Sea) { Caption = 'Sea'; }
    value(4; Rail) { Caption = 'Rail'; }
}
