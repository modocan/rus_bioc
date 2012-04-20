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
    private var bici:BiciMenu;

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
            item.texto_txt.x = -(item.texto_txt.width/2);
            if(i > 0)
            {
                item.x = this.getChildAt(i-1).x + this.getChildAt(i-1).width + (item.width/2) + 20;
            }
            addChild(item);
        }


        bici = new BiciMenu();
        bici.x = this.getChildByName('btn_0').x;
        bici.y = -5;
        addChild(bici);
    }


}
}
