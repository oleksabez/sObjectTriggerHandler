public class orderItemHelper extends sObjectTriggerHandler {
    public override void AfterInsert(List<sObject> snewList, List<sObject> soldList, Map<Id, sObject> snewMap, Map<Id, sObject> soldMap) {
        List<OrderItem> newList = (List<OrderItem>)snewList;
        Map<Id, List<OrderItem>> newMaps = new Map<Id, List<OrderItem>>();
        List<Id> reletedOrderId = new List<Id>();
        for(OrderItem oi: newList) {
            reletedOrderId.add(oi.OrderId);
            if(newMaps.containsKey(oi.OrderId)) {
                newMaps.get(oi.OrderId).add(oi);
            } else {
                newMaps.put(oi.OrderId, new List<OrderItem> { oi });
            }
        }
        Map<Id, Order> orderMap = new Map<Id, Order>([SELECT Id, Status FROM Order WHERE Id in: reletedOrderId]);
        Double total;
        for(Id orderId: newMaps.keySet()) {
            total = 0;
            for(OrderItem oi: newMaps.get(orderId)) {
                total += oi.TotalPrice;
            }
            if(total > 1000) {
                orderMap.get(orderId).Status = 'Sent';
            }
        }
        update orderMap.values();
    }
}