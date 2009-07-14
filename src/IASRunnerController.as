
import com.xoomcode.intraspection.core.IAS;
import com.xoomcode.intraspection.event.IASEvent;

import flash.external.ExternalInterface;

private var _ias:IAS;

public function onCreationComplete() : void {
   _ias = new IAS();
    
    _ias.addEventListener(IASEvent.LOADED, onIASLoaded);
    ExternalInterface.addCallback("loadApplication", iasLoadApplication);
    ExternalInterface.addCallback("setMessage", setMessage);
    ExternalInterface.addCallback("execute", iasExecute);
    ExternalInterface.addCallback("click", iasClick);
}


private function onIASLoaded(event:IASEvent) : void {
    msgLabel.text = "Application Loaded";
}

private function setMessage(message:String) : void {
    msgLabel.text = message;
}

private function iasLoadApplication(subject:String) : void {
    _ias.load(subject);
}

private function iasExecute(selector:String, method:String, params:Array = null) : void {
    _ias.execute(selector, method, params);
}

private function iasClick(selector:String) : void {
    _ias.click(selector);
}