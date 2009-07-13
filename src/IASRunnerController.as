
import com.xoomcode.intraspection.core.IAS;
import com.xoomcode.intraspection.event.IASEvent;

import flash.external.ExternalInterface;

import mx.controls.Alert;

private var _ias:IAS;

public function onCreationComplete() : void {
   _ias = new IAS();
    
    _ias.addEventListener(IASEvent.IAS_LOADED, onIASLoaded);
    ExternalInterface.addCallback("loadApplication", loadApplication);
    ExternalInterface.addCallback("setMessage", setMessage);
    ExternalInterface.addCallback("execute", iasExecute);
}


private function onIASLoaded(event:IASEvent) : void {
    msgLabel.text = "Application Loaded";
}

private function setMessage(message:String) : void {
    msgLabel.text = message;
}

private function loadApplication(subject:String) : void {
    _ias.load(subject);
}

private function iasExecute(selector:String, method:String, params:Array = null) : void {
    _ias.execute(selector, method, params);
}