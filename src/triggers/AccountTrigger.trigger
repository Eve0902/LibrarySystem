
trigger AccountTrigger on Account (after insert) {
    AccountHelper actHelper = new AccountHelper();
    actHelper.createOppByActs(trigger.new);
}