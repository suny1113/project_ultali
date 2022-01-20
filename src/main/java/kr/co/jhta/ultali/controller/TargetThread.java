package kr.co.jhta.ultali.controller;

public class TargetThread extends Thread{
    
    public void run(){
        
        for(long i=0; i<1_000_000_000; i++){}
        
        try{
            
            //1.5초간 일시 정지
            
            Thread.sleep(2000);
            
        }catch (InterruptedException e){}
        
        
        
        for(long i=0; i<1_000_000_000; i++){}
        
    }
}
    