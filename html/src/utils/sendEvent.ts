export const sendEvent = (eventName: string, data: object) => {
  // @ts-ignore
  fetch(`https://${GetParentResourceName()}/${eventName}`, {
    method: "POST",
    body: JSON.stringify(data),
  });
};
