export class APIError {
  type: "typeError" | "ServerError" | "yourError";
  message: string;

  constructor({
    type,
    message
  }: {
    type: "typeError" | "ServerError" | "yourError";
    message: string;
  }) {
    this.type = type;
    this.message = message;
  }
}
