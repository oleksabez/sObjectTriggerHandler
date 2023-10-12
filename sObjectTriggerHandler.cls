public virtual class sObjectTriggerHandler {
    protected virtual void BeforeInsert(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {}
    protected void beforeUpdate(List<SObject> oldRecords, 
                              List<SObject> newRecords, 
                              Map<ID, SObject> oldRecordMap, 
                              Map<ID, SObject> newRecordMap) 
    {}
    protected void beforeDelete(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {}
    protected virtual void AfterInsert(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {}
    protected void afterUpdate(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {}
    protected void afterDelete(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {}
    protected void afterUndelete(List<sObject> newList, List<sObject> oldList, Map<Id, sObject> newMap, Map<Id, sObject> oldMap) {}
    public void execute() {
        switch on Trigger.operationType {
            when BEFORE_INSERT {
                this.beforeInsert(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            when BEFORE_UPDATE {
                this.beforeUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            when BEFORE_DELETE {
                this.beforeDelete(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            when AFTER_INSERT {
                this.afterInsert(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            when AFTER_UPDATE {
                this.afterUpdate(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            when AFTER_DELETE {
                this.afterDelete(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
            when AFTER_UNDELETE {
                this.afterUndelete(Trigger.new, Trigger.old, Trigger.newMap, Trigger.oldMap);
            }
        }
    }
}