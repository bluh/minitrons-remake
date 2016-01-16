class ComparisonTronic extends Tronic implements InFlow{
    PImage sprite;
    int type;
    InFlow nextTronic;
    
    Node inNode;
    Node aNode;
    Node bNode;
    Node trueNode;
    Node falseNode;
    
    public ComparisonTronic(int x, int y, String name){
        this(0, x, y, name);
    }
    
    public ComparisonTronic(int type, int x, int y, String name){
        super(x, y, 48, 48, name);
        this.type = type;
        switch(type){
            case 0:
                sprite = loadImage("assets/ifequals.png");
                break;
            default:
                sprite = loadImage("assets/ifequals.png");
                break;
        }
        inNode = new Node(this, 2, -6, 21, -1, 0);
        aNode = new Node(this, 1, 21, -6, 0, -1);
        bNode = new Node(this, 1, 21, 48, 0, 1);
        trueNode = new Node(this, 3, 48, 30, 1, 0);
        falseNode = new Node(this, 3, 48, 12, 1, 0);
    }
    
    public Node getFlow(FlowDetails flow){
        if(flow.getData(aNode).equals(flow.getData(bNode))){
            return trueNode;
        }else{
            return falseNode;
        }
    }
    
    public int getType(){
        return type;
    }
    
    public void renderTronic(int screenX, int screenY){
        image(sprite, getX() - screenX, getY() - screenY);
    }
    
    public void renderNodes(int mouseX, int mouseY, int screenX, int screenY, boolean highlight){
        inNode.render(mouseX, mouseY, screenX, screenY, getX(), getY(), highlight);
        aNode.render(mouseX, mouseY, screenX, screenY, getX(), getY(), highlight);
        bNode.render(mouseX, mouseY, screenX, screenY, getX(), getY(), highlight);
        trueNode.render(mouseX, mouseY, screenX, screenY, getX(), getY(), highlight);
        falseNode.render(mouseX, mouseY, screenX, screenY, getX(), getY(), highlight);
    }
    
    public Node[] getNodes(){
        return new Node[]{inNode, aNode, bNode, trueNode, falseNode};
    }
}