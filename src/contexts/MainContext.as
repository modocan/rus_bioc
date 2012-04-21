/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 19/04/12
 * Time: 22:15
 * To change this template use File | Settings | File Templates.
 */
package contexts {
import commands.CambiaSeccionCommand;
import commands.CreacionCommand;
import commands.LoginCommand;
import commands.PideMenuCommand;
import commands.SubeMarcoCommand;

import events.ControlEvent;

import events.MenuEvent;
import events.PreguntasEvent;

import flash.display.DisplayObjectContainer;

import mediators.CajaLoginMediator;

import mediators.MainMediator;
import mediators.MenuMediator;
import mediators.SeccionPreguntasMediator;
import mediators.SeccionProductoMediator;
import mediators.SocialLinksMediator;


import models.IMainModel;
import models.MainModel;

import org.robotlegs.base.ContextEvent;
import org.robotlegs.mvcs.Context;

import models.FBConnection;

import models.IFBConnection;

import views.CajaLoginView;

import views.MainView;
import views.MenuView;
import views.SeccionPreguntaView;
import views.SeccionProductoView;
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
        commandMap.mapEvent(MenuEvent.CLICK_MENU, CambiaSeccionCommand, MenuEvent);
        commandMap.mapEvent(ControlEvent.SECCION, SubeMarcoCommand, ControlEvent);
        commandMap.mapEvent(PreguntasEvent.LOGIN, LoginCommand, PreguntasEvent);
    }


    private function mapModels():void
    {
        injector.mapSingletonOf(IMainModel, MainModel);
        injector.mapSingletonOf(IFBConnection, FBConnection);
    }


    private function mapViews():void
    {
        mediatorMap.mapView(MenuView, MenuMediator);
        mediatorMap.mapView(MainView, MainMediator);
        mediatorMap.mapView(SocialLinksView, SocialLinksMediator);
        mediatorMap.mapView(SeccionPreguntaView, SeccionPreguntasMediator);
        mediatorMap.mapView(SeccionProductoView, SeccionProductoMediator);
        mediatorMap.mapView(CajaLoginView, CajaLoginMediator);
    }


}
}
