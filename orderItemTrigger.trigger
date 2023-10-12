trigger orderItemTrigger on OrderItem (after insert) {
    new orderItemHelper().execute();
}