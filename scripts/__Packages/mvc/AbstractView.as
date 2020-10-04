class mvc.AbstractView implements mvc.View, obs.Observer
{
   function AbstractView(m, c)
   {
      this.setModel(m);
      this.setController(c);
   }
   function setModel(m)
   {
      this.model = m;
   }
   function getModel()
   {
      return this.model;
   }
   function setController(c)
   {
      this.controller = c;
      this.getController().setView(this);
   }
   function getController()
   {
      return this.controller;
   }
   function update(o, infoObj)
   {
   }
}
