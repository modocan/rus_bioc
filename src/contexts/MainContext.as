/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 19/04/12
 * Time: 22:15
 * To change this template use File | Settings | File Templates.
 */
package contexts {
import commands.CreacionCommand;
import commands.PideMenuCommand;

import events.MenuEvent;

import flash.display.DisplayObjectContainer;

import mediators.MainMediator;
import mediators.MenuMediator;
import mediators.SocialLinksMediator;

import models.IMainModel;
import models.MainModel;

import org.robotlegs.base.ContextEvent;

import org.robotlegs.mvcs.Context;

import views.MainView;
import views.MenuView;
import views.SocialLinksView;

public class MainContext extends Context {

    public function MainContext(contextView:DisplayObjectContainer=null) {
        super(contextView);
    }

    override public function startup():void
    {
        mapCommands();
        mapModels();
        mapViews();

        super.startup();
    }


    private function mapCommands():void
    {
        commandMap.mapEvent(ContextEvent.STARTUP_COMPLETE, CreacionCommand, ContextEvent);
        commandMap.mapEvent(MenuEvent.PIDE_MENU, PideMenuCommand, MenuEvent);
    }


    private function mapModels():void
    {
         injector.mapSingletonOf(IMainModel, MainModel);
    }


    private function mapViews():void
    {
        mediatorMap.mapView(MenuView, MenuMediator);
        mediatorMap.mapView(MainView, MainMediator);
        mediatorMap.mapView(SocialLinksView, SocialLinksMediator);
    }


}
}
