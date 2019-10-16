public class TemperatureConverter {
    /**
    * @description convert temperature from fahrenhei to celsius
    * @param fh    fahrenheit temperature 
    */
    public static Decimal FahrenheitToCelsius(Decimal fh) {
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);
    }
}