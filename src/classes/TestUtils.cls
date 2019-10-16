/**
 * Created by lili on 10/11/2019.
 */

@IsTest
public with sharing class TestUtils {
    public static final String accountName = 'test';
    public static final Integer numOfAccts = 3;
    public static final Integer numOfOpps = 2;
    public static final Integer daysFromToday = 7;
    public static final String opportunityName = 'opp';
    public static final String oppStageName ='Prospecting';




  public static Account createAccount(Boolean doInsert){
    Account act = new Account(Name = accountName);
      if(doInsert){
          insert act;
      }
      return act;
}

    public static List<Account> createAccountsByNum(Integer numOfAccts, Boolean doInsert) {
        List<Account> accts = new List<Account>();
        for (Integer i = 0; i < numOfAccts; i++) {
            Account act = new Account(Name = 'test' + i);
            accts.add(act);
        }
        if (doInsert) {
            insert accts;
        }
        return accts;
    }

    public static Opportunity createOppotunityWithAccount(Id accountId, Boolean doInsert) {
        Date close = Date.today().addDays(daysFromToday);
        Opportunity opp =  new Opportunity(Name = opportunityName, AccountId= accountId,CloseDate = close,
                StageName = oppStageName);
        if(doInsert){
            insert opp;
        }
        return opp;
    }


    public static Opportunity createOppotunityWithoutAccount( Boolean doInsert) {
        Date close = Date.today().addDays(daysFromToday);
        Opportunity opp =  new Opportunity(Name = opportunityName, CloseDate = close,
                StageName = oppStageName);
        return opp;
    }

    public static List<Opportunity> createOppotunitiesWithoutAccount(Integer numOfOpp, Boolean doInsert) {
        List<Opportunity> opps = new List<Opportunity>();
        Date close = Date.today().addDays(daysFromToday);

        for (Integer i = 0; i < numOfOpps; i++) {
            Opportunity opp = new Opportunity(Name = opportunityName + i, CloseDate = close,
                    StageName = oppStageName);
            opps.add(opp);
        }
        if (doInsert) {
            insert opps;
        }
        return opps;
    }






}