class events.BushFireEvent extends events.Event
{
   function BushFireEvent()
   {
      super();
      this.image = "bushfirepic";
      this.title = _root.bushFireEventTitle;
      this.description = _root.bushFireEvDe;
      this.secDescription = _root.bushFireEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("fire");
   }
}
