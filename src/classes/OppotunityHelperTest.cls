/**
 * Created by lili on 10/8/2019.
 */

@IsTest
private class OppotunityHelperTest {
    @testSetUP
    static void setup(){
        List<Account> accts = TestUtils.createAccountsByNum(TestUtils.numOfAccts, true);
    }


    @IsTest
    static void updateNumOfOppsWithDefualtNum() {
        List<Account> accts = [SELECT Id,Number_of_Opps__c FROM Account];
        for (Account acct : accts){
            System.assertEquals(1,acct.Number_of_Opps__c ,
                    'the number of Opportunities are correct while originally 0');
        }
    }

    @IsTest
    static void updateNumOfOppsInitilNumOne() {
        List<Account> accts = [SELECT Id,Number_of_Opps__c,Name FROM Account];
        Opportunity opp = TestUtils.createOppotunityWithAccount(accts[0].Id,true);
        List<Account> acct = [SELECT Id, Number_of_Opps__c FROM Account WHERE Id=:accts[0].Id];
        System.assertEquals(2,acct[0].Number_of_Opps__c,'Number_of_Opps__c by adding one new Opportunity is correct');
    }

    @IsTest
    static void updateNumOfOppsWithOneAccount() {

        Opportunity oppWithoutAcct = TestUtils.createOppotunityWithoutAccount(true);
        List<Opportunity> opps = [
                SELECT Id,
                        AccountId
                FROM Opportunity
        ];
        OppotunityHelper oppHelper = new OppotunityHelper();
        Test.startTest();
        List<Account> attc = oppHelper.getParentAccounts(opps);
        Test.stopTest();
        System.assertEquals(TestUtils.numOfAccts, attc.size(),'Not all of Opportunity has Accounts');
    }


    @IsTest
    static void updateNumOfOppsWithoutAccount() {
        List<Opportunity> opps = TestUtils.createOppotunitiesWithoutAccount(TestUtils.numOfOpps,true);
        OppotunityHelper oppHelper = new OppotunityHelper();
        Test.startTest();
        List<Account> attc = oppHelper.getParentAccounts(opps);
        Test.stopTest();
        System.assertEquals(0,attc.size(),'Opportunity has no account ');
    }


    @IsTest
    static void getParentAccounts() {
        List<Opportunity> opps = [
                SELECT Id,
                        AccountId
                FROM Opportunity
        ];
        OppotunityHelper oppHelper = new OppotunityHelper();
        Test.startTest();
        List<Account> attc = oppHelper.getParentAccounts(opps);
        Test.stopTest();
        System.assertEquals(  TestUtils.numOfAccts,attc.size(),'getParentAccount successfully');
    }
}