plot_alignment <- function(alignment){
  
  x_labels <- names(alignment)
  
  label_mapping <- data.frame(RowID = seq_len(length(x_labels)), SequenceName = x_labels)
  
  align_mat <- as.matrix(alignment)
  
  alignment_df <- as.data.frame(align_mat, stringsAsFactors = FALSE)
  
  alignment_df$RowID <- seq_len(nrow(alignment_df))
  
  reshaped_df <- pivot_longer(alignment_df, 
                              cols = -RowID, 
                              names_to = "Position", 
                              values_to = "Nucleotide")
  
  reshaped_df <- reshaped_df %>%
    mutate(Position = as.numeric(gsub("^V", "", Position)))
  
  reshaped_df <- left_join(reshaped_df, label_mapping, by = "RowID")
  
  nuc_colors <- c("A" = "#66c2a5", "T" = "#fc8d62", "C" = "#8da0cb", "G" = "#e78ac3", "-" = "#a6d854")
  
  p <- ggplot(reshaped_df, aes(x = Position, y = SequenceName, col = "transparent", fill = Nucleotide)) +
    geom_tile(color = "white", width = 1) +
    scale_fill_manual(values = nuc_colors, name = "Nucleotide") +
    labs(x = "Position", y = "Sequence", title = " ") +
    theme_minimal() +
    theme(panel.grid = element_blank(),
          panel.grid.major = element_blank(),
          panel.grid.minor = element_blank(),
          panel.border = element_blank(),  plot.margin = unit(c(4,0.01,4,0.01),"cm"),
          legend.direction = "horizontal",
          legend.position= "bottom", 
          strip.text = element_text(size=18, face="bold"),
          strip.background = element_blank(),
          legend.key.size = unit(2,"line"),
          legend.key.width = unit(1.5,"line"),
          legend.text = element_text(size=16, face="bold"),
          legend.title = element_text(size=18, face="bold"),
          axis.title.x = element_text(size=24, face="bold"),
          axis.title.y = element_blank(),
          axis.text.x = element_text(face="bold", size=18),
          axis.text.y = element_text(size=8, face="bold"),
          plot.title = element_text(size=22, face="bold"))
  
  return(p)
}
