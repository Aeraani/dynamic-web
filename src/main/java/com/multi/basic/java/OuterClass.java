package com.multi.basic.java;
//MemberInnerClass
// 자바는 이너클래스는 만들 수 있음, 이너메서드 없음
public class OuterClass {
    private int outerValue;
    public OuterClass() { // 외부생성자
        System.out.println("OuterClass()");
    }
    private void showOuter(){
        System.out.println("ShowOuter()");
    }
    public class InnerClass { // 클래스 안에 이너클래스생성=멤버이너클래스
        private int innerValue;
        public InnerClass() { // 내부 생성자
            System.out.println("InnerClass()");
            innerValue = 1; // 자기 자신은 private라도 접근가능
            outerValue = 10; // 내부에서는 외부의 instance변수나 method가 private여도 잡근 가능하다
        }
        public void showInner(){//InnerClass Method
            showOuter(); //OuterClass Method Call
        }
    }

    public static void main(String[] args) {
        //new InnerClass(); 내부 생성만 하는것은 불가
        OuterClass.InnerClass innerClass = new OuterClass().new InnerClass();
        innerClass.showInner();
    }
}
