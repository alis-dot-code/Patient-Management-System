import { Component, EventEmitter, Output } from '@angular/core';
import { FormsModule } from '@angular/forms';
import { CommonModule } from '@angular/common';

@Component({
  selector: 'app-search-bar',
  standalone: true,
  imports: [CommonModule, FormsModule],
  template: `
    <div class="search-container">
      <input 
        type="text" 
        [(ngModel)]="query" 
        [placeholder]="placeholderText" 
        (keyup.enter)="onSearch()" />
      <button (click)="onSearch()" [disabled]="!query.trim()">Search</button>
    </div>
  `,
  styles: [`
    .search-container { display: flex; gap: 8px; margin-bottom: 20px; }
    input { flex: 1; padding: 8px; border-radius: 4px; border: 1px solid #ccc; }
    button { padding: 8px 16px; cursor: pointer; }
  `]
})
export class SearchBarComponent {
  query = '';
  placeholderText = 'Enter Patient SSN...';
  
  @Output() search = new EventEmitter<string>();

  onSearch() {
    if (this.query.trim()) {
      this.search.emit(this.query.trim());
    }
  }
}
