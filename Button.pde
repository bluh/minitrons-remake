class Button implements Tronic, Clickable{
    int x;
    int y;
    PImage sprite;
    boolean cooldown;
    final int WIDTH = 48;
    final int HEIGHT = 48;
    
    Node outNode;
    
    public Button(int x, int y){
        this(0, x, y);
    }
    
    public Button(int type, int x, int y){
        //this.type = type;
        this.x = x;
        this.y = y;
        switch(type){
            case 0:
                sprite = loadImage("assets/rbutton.png");
                break; //TODO: add more buttons
            default:
                sprite = loadImage("assets/rbutton.png");
                break;
        }
        cooldown = false;
        outNode = new Node(this, 3, 48, 21, 1, 0);
    }
    
    public void clicked(int x, int y){
        if(!cooldown){
            cooldown = true;
            sendFlow();
            addEvent(new QueuedEvent(){
                public double getDelay(){
                    return 1.0;
                }
                public void invoke(){
                    cooldown = false;
                }
            });
        }
    }
    
    public void sendFlow(){
        println("Sending flow.");
        if(outNode.getNumWires() > 0){
            outNode.getWire(0).activateWire(outNode);
        }
    }
    
    public void renderTronic(int screenX, int screenY){
        image(sprite, x - screenX, y - screenY);
    }
    
    public void renderNodes(int mouseX, int mouseY, int screenX, int screenY, boolean highlight){
        outNode.render(mouseX, mouseY, screenX, screenY, x, y, highlight);
    }
    
    public Node[] getNodes(){
        return new Node[]{outNode};
    }
    
    public int getX(){
        return this.x;
    }
    
    public int getY(){
        return this.y;
    }
    
    public int getWidth(){
        return this.WIDTH;
    }
    
    public int getHeight(){
        return this.HEIGHT;
    }
    
    public void moveTronic(int x, int y){
        this.x = x;
        this.y = y;
    }
    
    public void deleteTronic(){
        for(Node node: getNodes()){
            for(int i = 0; i < node.getNumWires(); i++){
                node.getWire(i).deleteWire();
            }
        }
    }
}
        