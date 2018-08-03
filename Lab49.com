
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

class Test4 {
	  private final static class Athlete {
	    public final int height;
	    public final String profession;
	    public final String name;
	    
	    public Athlete(String name, int height, String profession) {
	      this.name = name;
	      this.height = height;
	      this.profession = profession;
	    }
	    
     }  
	  private final static List<Athlete> ATHLETES = Arrays.asList(
	      new Athlete("Bob", 190, "basketball"),
	      new Athlete("Alex", 170, "soccer"),
	      new Athlete("Frank", 130, "basketball"),
	      new Athlete("Shorty", 175, "basketball"),
	      new Athlete("Jane", 190, "chess"));

	  // NOTE: Do not change any code above this line
	  
	  public static void main(String[] args) {
	  System.out.println(new AthleteRepo().printAll(ATHLETES));  // Frank, Shorty and Jane
	  }
	  
	  public static class AthleteRepo {
	    public ArrayList<String> printAll(List<Athlete> all) {
	         return  all.stream().filter(a ->rare(a)==true).map(a ->a.name)
	        		 .collect(Collectors.toCollection(ArrayList::new));
	    }
	   }
	     public static boolean rare(Athlete a) {
	      return  ( (a.height > 180  &&  a.profession != "basketball" ) 
	    		     || (a.height < 180  && a.profession == "basketball"));
	      }
	}
