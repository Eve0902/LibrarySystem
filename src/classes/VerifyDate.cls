/**
 * @description a class for comparing two dates
 */

public class VerifyDate {

    /**
     * @description  handle potential checks against two dates
     * @param date1  date to be compared
     * @param date2  date to be compared
     * @return       if date2 is within 30 days compare to date1, return date2
     *               otherwise, return the last day of the month of date1
     *
     */
    public static Date CheckDates(Date date1, Date date2) {
        if(DateWithin30Days(date1,date2)) {
            return date2;
        } else {
            return SetEndOfMonthDate(date1);
        }
    }

    /**
     *  @description   method to check if date2 is within the next 30 days of date1
     *  @param date1  date to be compared
     *  @param date2  date to be compared
     *  @return       return ture if 0 <= date2 - date1 < 30
     *                return false otherwise
     */
    private static Boolean DateWithin30Days(Date date1, Date date2) {
        //check for date2 being in the past
        if( date2 < date1) { return false; }

        //check that date2 is within (>=) 30 days of date1
        Date date30Days = date1.addDays(30); //create a date 30 days away from date1
        if( date2 >= date30Days ) { return false; }
        else { return true; }
    }
    
    /**
     *  @description  method to return the end of the month of date1
     *  @param date1  date to be compared
     *  @param date2  date to be compared
     *  @return       a date
     */
    private static Date SetEndOfMonthDate(Date date1) {
        Integer totalDays = Date.daysInMonth(date1.year(), date1.month());
        Date lastDay = Date.newInstance(date1.year(), date1.month(), totalDays);
        return lastDay;
    }

}