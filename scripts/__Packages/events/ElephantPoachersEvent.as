class events.ElephantPoachersEvent extends events.Event
{
   function ElephantPoachersEvent()
   {
      super();
      this.image = "elephantpoacherspic";
      this.title = _root.elephantPoachersEventTitle;
      this.description = _root.elephantPoachersEvDe;
      this.secDescription = _root.elephantPoachersEvDe2nd;
      mvcFarm.FarmModel.getModel().handle_event("elephant");
   }
}
