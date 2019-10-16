/**
 * Created by lili on 10/1/2019.
 */

public with sharing class AccountHelper {
    /**
     *
     * @description     create a list of Opportunity according to the  accounts,
     *                  close date : a week from today
     *                  Stage: Prospecting
     * @param accounts  a list of Account
     */
    public void createOppByActs(List<Account> accounts) {
        if (!accounts.isEmpty()) {
            List<Opportunity> opps = new List<Opportunity>();
            Date close = Date.today().addDays(7);
            for (Account act : accounts) {
                Opportunity opp = new Opportunity(Name = act.Name, AccountId = act.Id, CloseDate = close,
                        StageName = 'Prospecting');
                opps.add(opp);
            }
            insert opps;
        }
    }
}