import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Int "mo:base/Int";
import Float "mo:base/Float";
actor DBank{
  stable var currentValue: Float = 200;
  //currentValue := 200;
  Debug.print("hello world");
  let id = 4567897654;
  Debug.print(debug_show(currentValue));

  stable var startTime = Time.now();
  //startTime := Time.now();
  Debug.print(debug_show(startTime));
  var currentTime = Time.now();

  public func depositin(amount: Float) {
    currentValue += amount;
    Debug.print(debug_show(currentValue));
  };

  public query func checkBalance(): async Float{
    return currentValue;
  };

  public func depositout(amount: Float){
    let typeValue: Float = currentValue - amount;
    if (typeValue >= 0){
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
   }
    else{
      Debug.print("You can not withdraw more that what is in your account");
    }
  };
  public func compound(){
  let currentTime = Time.now();
  let timepassedNS = currentTime - startTime;
  let timepassedS = timepassedNS / 1000000000;
  currentValue := currentValue * (1.00001 ** Float.fromInt(timepassedS));
  startTime := currentTime;
  };

  
}