@isTest
public class orderItemHelperTest {
    @testSetup
    private static void dataFactory() {
        Account acc = new Account(Name='Test');
        insert acc;
        Contract cntr = new Contract(AccountId=acc.Id,StartDate=System.today(),ContractTerm=6,Status='Draft');
        insert cntr;
        insert new Order(AccountId=acc.Id,EffectiveDate=System.today(),Status='OnProcess');
        Order ord = new Order(AccountId=acc.Id,EffectiveDate=System.today(),Status='OnProcess',Pricebook2Id=Test.getStandardPriceBookId());
        insert ord;
        Product2 testProduct = new Product2(Name='Test');
        insert testProduct;
        insert new PricebookEntry(Product2Id=testProduct.Id,Pricebook2Id=Test.getStandardPriceBookId(),UnitPrice=15);
    }
    private static testMethod void testAfterInsert() {
        Order ord = new Order(AccountId=[SELECT Id FROM Account LIMIT 1].Id,
                              EffectiveDate=System.today(),
                              Status='OnProcess',
                              Pricebook2Id=Test.getStandardPriceBookId());
        insert ord;
        insert new OrderItem(Quantity=100,UnitPrice=100,OrderId=ord.Id,PricebookEntryId=[SELECT Id FROM PricebookEntry LIMIT 1].Id);
    }
}