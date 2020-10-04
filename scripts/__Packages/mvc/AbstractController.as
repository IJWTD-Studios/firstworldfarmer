class mvc.AbstractController implements mvc.Controller
{
   function AbstractController(m)
   {
      this.setModel(m);
   }
   function setModel(m)
   {
      this.model = m;
   }
   function getModel()
   {
      return this.model;
   }
   function setView(v)
   {
      this.view = v;
   }
   function getView()
   {
      return this.view;
   }
}
