package k.mysimpleserver;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import java.io.IOException;
import javax.ws.rs.core.Context;
import javax.ws.rs.core.UriInfo;
import javax.ws.rs.Produces;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.PUT;
import javax.ws.rs.PathParam;
import javax.ws.rs.core.MediaType;

/**
 * REST Web Service
 *
 * @author Kristin
 */
@Path("/counter")
public class GenericResource 
{ 
    static Gson gson = new GsonBuilder().setPrettyPrinting().create(); 
    private Counter counter = new Counter(5);
    
    @Context
    private UriInfo context;
   // private Counter counter = new Counter(1);
    //private int counter = 4;
    
    public GenericResource() {
    }

    @GET
    public String getCount() 
    {   
        return gson.toJson(counter.count) + " Halloooooo";
    }
    
    @PUT
    @Consumes(MediaType.APPLICATION_JSON)
    @Path("/{value}")
    public String setCount(@PathParam("value") String value ) throws Exception 
    {
        //int temp = Integer.parseInt(value);
        // counter += value;
        return gson.toJson(value);
    }  
}
