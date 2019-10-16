@IsTest
private class AccountHelperTest {

    @IsTest
    static void testAddOneAct() {
        AccountHelper  actHelper = new AccountHelper();
        List<Account> acts = new List<Account>();
        Account act = new Account(Name = 'act');
        acts.add(act);
        Test.startTest();
        insert acts;
        Test.stopTest();

        Opportunity opt = [SELECT Name,CloseDate,AccountId FROM Opportunity WHERE AccountId = :act.Id];
        System.assertEquals(act.Name,opt.Name);
        Date close = Date.today().addDays(7);
        System.assertEquals(close,opt.CloseDate);
        System.assertEquals(act.Id,opt.AccountId);
    }

    @IsTest
    static void testAddMoreThanOneAct() {
        AccountHelper  actHelper = new AccountHelper();
        List<Account> acts = new List<Account>();
        Account act = new Account(Name = 'act');
        Account actOne = new Account(Name = 'act1');
        acts.add(act);
        acts.add(actOne);
        Test.startTest();
        insert acts;
        Test.stopTest();
        Date close = Date.today().addDays(7);

        Opportunity opt = [SELECT Name,CloseDate,AccountId FROM Opportunity WHERE AccountId = :act.Id];
        Opportunity optOne = [SELECT Name,CloseDate,AccountId FROM Opportunity WHERE AccountId = :actOne.Id];

        System.assertEquals(act.Name,opt.Name);
        System.assertEquals(0, close.daysBetween(opt.CloseDate));
        System.assertEquals(act.Id,opt.AccountId);

        System.assertEquals(actOne.Name,optOne.Name);
        System.assertEquals(0, close.daysBetween(optOne.CloseDate));
        System.assertEquals(actOne.Id, optOne.AccountId);
    }
}