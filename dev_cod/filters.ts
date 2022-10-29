history_filter_data(): void {
  this.history_filter_date = [
    {name: 'Date New to Old', code:'new'},
    {name: 'Date Old to New', code: 'old'},
  ]

  this.history_filter_name = [
    {name: 'Name A to Z', code: 'A'},
    {name: 'Name Z to A', code: 'Z'}
  ]
}

filter_history_by_date(event: any): void {
  if (event.code === 'new') {
    let new_to_old = this.forecast_history.sort(
      (a:any, b:any) => b.id - a.id 
    );
    this.forecast_history = new_to_old;
  } 
  if (event.code === 'old') {
    let old_to_new = this.forecast_history.sort(
      (a:any, b:any) => a.id - b.id 
    );
    this.forecast_history = old_to_new;
  }
}

filter_history_by_name(event: any): void {
  if (event.code === 'A') {
    let a_z = this.forecast_history.sort(
      (a:any, b:any) => a.location.localeCompare(b.location)
    );
    this.forecast_history = a_z;
  } 
  if (event.code === 'Z') {
    let z_a = this.forecast_history.sort(
      (a:any, b:any) => b.location.localeCompare(a.location)
    );
    this.forecast_history = z_a;
  }
}

filter_history_by_input_data(event: any): void {
  const filtered_list: any[] = [];

  this.api.request_post('history/').subscribe(
    (response: any) => {
      for (let f of response.body) {
        // Filter data by pattern.
        const eql = this.filter_service.filters
          .equals(f.location, this.filter_input_value);
        const cnt = this.filter_service.filters
          .contains(f.location, this.filter_input_value);

        if (eql || cnt) {
          filtered_list.push(f);
          this.forecast_history = filtered_list;
          this.forecast_length = filtered_list.length;
        } 
      }
    }
  );
}
