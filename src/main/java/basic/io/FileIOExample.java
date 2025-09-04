package basic.io;

import java.io.BufferedOutputStream;
import java.io.FileOutputStream;

/*
Stream은 흐름을 말한다.
Byte를 가지고 흘러가면 ByteStream이고 Character를 가지고 흘러가면  CharacterStream이다*/
public class FileIOExample {//ByteStream관련
    public static void main(String[] args) {
        try{
            FileOutputStream fos=new FileOutputStream("C:\\iowrite.txt");
            // new FileOutputStream목적지로 운반하는 운반(stream) 객체 뒤에 stream 분터있으면 byte날림 / "C:\\iowrite.txt" 이동 목적지
            BufferedOutputStream bos=new BufferedOutputStream(fos);
            String content = "Hello, this is a file IO example in Java!";
            bos.write(content.getBytes());
            bos.flush();
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
