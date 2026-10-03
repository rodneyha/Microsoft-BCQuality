enum 50270 "Sample Shipping Method Good"
{
    Extensible = true;

    value(0; " ") { Caption = ' '; }
    value(10; Air) { Caption = 'Air'; }
    value(15; Express) { Caption = 'Express'; } // Added later at its alphabetical position, in the gap between 10 and 20.
    value(20; Rail) { Caption = 'Rail'; }
    value(30; Road) { Caption = 'Road'; }
    value(40; Sea) { Caption = 'Sea'; }
}
