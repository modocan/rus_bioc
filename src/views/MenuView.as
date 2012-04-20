/**
 * Created with IntelliJ IDEA.
 * User: barbaradominguez
 * Date: 20/04/12
 * Time: 12:33
 * To change this template use File | Settings | File Templates.
 */
package views {
import flash.display.Sprite;
import flash.text.TextFieldAutoSize;

public class MenuView extends Sprite {

    private var item:BtnMenu;

    public function MenuView() {

    }

    public function creaItems(listado:Array):void
    {
        for(var i:int = 0; i < listado.length; i++)
        {
            item = new BtnMenu();
            item.name = 'btn_'+i;
            item.mouseChildren = false;
            item.texto_txt.text = listado[i];
            item.texto_txt.autoSize = TextFieldAutoSize.CENTER;
            item.x = (item.width + 30) * i;
            addChild(item);
        }
    }


}
}
