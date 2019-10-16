/**
* @description a class which collect the new cases
 */
public class NewCaseListController {
/**
* @description get the new cases
 */
    public List<Case> getNewCases() {
        List<Case> results = [SELECT CaseNumber FROM Case WHERE status='New'];
        return results;
    }
}