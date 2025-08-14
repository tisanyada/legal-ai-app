String getFileMimeType(String? extension) {
  switch (extension?.toLowerCase()) {
    case 'jpg':
    case 'jpeg':
      return 'image/jpeg';
    case 'png':
      return 'image/png';
    case 'pdf':
      return 'application/pdf';
    // Add more cases as needed
    default:
      return 'application/octet-stream';
  }
}
