package kr.co.jhta.ultali.controller;

public class PageThread extends Thread{
    private Thread targetThread;
    
    
    public PageThread(Thread TargetThread){
        
        this.targetThread = TargetThread;
    }
    
    public void run(){
        
        while (true){
            Thread.State state = targetThread.getState(); //스레드 상태 얻기
            System.out.println("타켓 스레드 상태: " + state);
            
            //객체 생성 상태일 경우 실행 대기 상태로 만듦
            if(state ==  Thread.State.NEW){
                targetThread.start();
            }
            
            //종료 상태일 경우 while문을 종료함
            if(state == Thread.State.TERMINATED){
                break;
            }
            
            try{
                Thread.sleep(3000);
            }catch (InterruptedException e){}
        }
    }
}
