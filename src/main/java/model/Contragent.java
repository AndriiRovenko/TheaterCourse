package model;

/**
 * Created by andrew on 6/4/16.
 */
public class Contragent {
    private int id;

    private Agent agent;
    private ContragentCategory category;
    private Location location;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Agent getAgent() {
        return agent;
    }

    public void setAgent(Agent agent) {
        this.agent = agent;
    }

    public ContragentCategory getCategory() {
        return category;
    }

    public void setCategory(ContragentCategory category) {
        this.category = category;
    }

    public Location getLocation() {
        return location;
    }

    public void setLocation(Location location) {
        this.location = location;
    }
/*
    @Override
    public String toString() {
        return String.format(
                "Product [id=%s, name=%s %s, category=%s, phone=%s, mail=%s, edrpu=%s, location=%s state=%s]\n",
                id, agentFirstName, agentLastName, category, agentPhone, agentMail, agentEdrpu, location, state
        );
    }
*/

}
