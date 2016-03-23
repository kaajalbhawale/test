public class BasicProgramming 
{
	
	public  void fibonacciSeriesGenerator(Integer n )
	{
	
	List<integer> series = new List<integer>();
	
	integer result;
	series.add(0);
	series.add(1);
	
	
		for(Integer i=2;i<n;i++)
		{
			result = series[i-1] + series[i-2];
	
			series.add(result);
	
		}
							
		for(Integer j=0;j<n;j++)						
		{
	
		system.debug('The fibonacci Series is: ' +series[j]);
		}
	
	}
	
	public void reverseString(String source)
	{
		source = source.reverse();
		system.debug('The Reverse is: ' +source);
	}
	
	public void stringOperation(String source)
	{
		source = source.replace('@','A');
		system.debug('The Replacement is: ' +source);
		
		system.debug('The Substring is : ' + source.substring(11,source.length()));
		
		system.debug('The Splited parts are : '+ source.split(' '));
		
		system.debug('The String without Whitespaces is: ' +source.deleteWhitespace());
		
		String upperCase = source.toUpperCase();
		system.debug('The Upper case String is: ' +upperCase);
		
		String lowerCase = source.toLowerCase();
		system.debug('The Lower case String is: ' +lowerCase);
		//Integer counter= source.countMatches('');
		
		
	
	}
	
	
	public void countOccurrence(String source)
	{
	
		String[] character = source.split('');
	
	}

}