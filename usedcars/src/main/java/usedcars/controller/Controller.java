package usedcars.controller;

public class Controller {
	
	
	public void main(String[] args) {
		iterate("alma", new String[]{"korte1", "korte2"});
		iterate("alma", "korte");
	}
	
	public void iterate(String alma, String... kortes) {
		for(String korte : kortes) {
			
		}
	}
}
