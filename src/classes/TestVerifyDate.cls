/**
* @describtion This is the unit test class for verifyDate class
* */

@isTest
public class TestVerifyDate {

    @isTest static void Date2LessThanDate1() {
        Date testDate2 = Date.today();
        Date testDate1 = testDate2.addDays(2);
        Integer totalDays = Date.daysInMonth(testDate1.year(), testDate1.month());
        Date lastDay = Date.newInstance(testDate1.year(), testDate1.month(), totalDays);
        System.assertEquals(lastDay,VerifyDate.CheckDates(testDate1,testDate2));

    }

    @isTest static void Date2MoreThan30() {

        Date testDate1= Date.today();
        Date testDate2 = testDate1.addDays(31);
        Integer totalDays = Date.daysInMonth(testDate1.year(), testDate1.month());
        Date lastDay = Date.newInstance(testDate1.year(), testDate1.month(), totalDays);
        System.assertEquals(lastDay,VerifyDate.CheckDates(testDate1,testDate2));

    }

    @isTest static void Date2MoreEqual30() {

        Date testDate1= Date.today();
        Date testDate2 = testDate1.addDays(30);
        Integer totalDays = Date.daysInMonth(testDate1.year(), testDate1.month());
        Date lastDay = Date.newInstance(testDate1.year(), testDate1.month(), totalDays);
        System.assertEquals(lastDay,VerifyDate.CheckDates(testDate1,testDate2));

    }

    @isTest static void Date2InRange() {

        Date testDate1= Date.today();
        Date testDate2 = testDate1.addDays(20);
        System.assertEquals(testDate2,VerifyDate.CheckDates(testDate1,testDate2));

    }



}