class mvcFarm.FarmController extends mvc.AbstractController
{
   function FarmController(fm)
   {
      super(fm);
      this.model = (mvcFarm.FarmModel)this.getModel();
   }
   function invest(investment)
   {
      this.model.addInvestment(investment);
   }
   function initNotify()
   {
      this.model.notify();
   }
   function newGame()
   {
      this.model.init();
   }
   function makeEvent()
   {
      events.EventGenerator.generateEvent();
   }
}
