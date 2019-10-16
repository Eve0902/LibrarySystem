/**
 * Created by lili on 10/8/2019.
 */

trigger OppoturnityTrigger on Opportunity (after insert) {
    OppotunityHelper oppHelper = new OppotunityHelper();
    oppHelper.updateNumOfOpps(trigger.new);

}