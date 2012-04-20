/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 20/04/12
 * Time: 12:39
 * To change this template use File | Settings | File Templates.
 */
package mediators {
import events.MenuEvent;

import flash.events.Event;

import org.robotlegs.mvcs.Mediator;

import views.MenuView;

public class MenuMediator extends Mediator {

    [Inject]
    public var vista:MenuView;

    public function MenuMediator() {
        super();
    }

    override public function onRegister():void
    {
        eventMap.mapListener(eventDispatcher, MenuEvent.LISTADO_MENU, pintaMenu);

        pideListado();
    }


    private function pideListado():void
    {
        eventDispatcher.dispatchEvent(new MenuEvent(MenuEvent.PIDE_MENU));
    }


    private function pintaMenu(e:MenuEvent):void
    {
        vista.creaItems(e.secciones);
        eventDispatcher.dispatchEvent(new MenuEvent(MenuEvent.PINTA_MENU));
    }

}
}
