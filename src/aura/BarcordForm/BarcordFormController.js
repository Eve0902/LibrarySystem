/**
 * @deccription This is a class for showing Success message on upsertion of record
 */

({
    onSuccess: function(component,event,helper){
        //
        var resultToast = $A.get("e.force:showToast");
        resultToast.setParams({
                            "title": "Success!",
                            "message": "Your Book Return Successfully"
                        });
        resultToast.fire();
        var homeEvent = $A.get("e.force:navigateToObjectHome");
    	homeEvent.setParams({
        	"scope": "Borrower__c"
    	});
    	homeEvent.fire();
    }
})