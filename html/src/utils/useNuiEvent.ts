import { onDestroy } from "svelte";

// Source: https://github.com/project-error/svelte-lua-boilerplate/blob/main/web/src/utils/useNuiEvent.ts

interface NuiMessage<T = unknown> {
  type: string;
  data: T;
}

type NuiEventHandler<T = any> = (data: T) => void;

const eventListeners = new Map<string, NuiEventHandler[]>();

const eventListener = (event: MessageEvent<NuiMessage>) => {
  const { type, data } = event.data;
  const handlers = eventListeners.get(type);

  if (handlers) {
    handlers.forEach((handler) => handler(data));
  }
};

window.addEventListener("message", eventListener);

/**
 * A function that manage events listeners for receiving data from the client scripts
 * @param type The specific `type` that should be listened for.
 * @param handler The callback function that will handle data relayed by this function
 *
 * @example
 * useNuiEvent<{visibility: true, wasVisible: 'something'}>('setVisible', (data) => {
 *   // whatever logic you want
 * })
 *
 **/
export function useNuiEvent<T = unknown>(
  type: string,
  handler: NuiEventHandler<T>
) {
  const handlers = eventListeners.get(type) || [];
  handlers.push(handler);
  eventListeners.set(type, handlers);

  onDestroy(() => {
    const handlers = eventListeners.get(type) || [];

    eventListeners.set(
      type,
      handlers.filter((h) => h !== handler)
    );
  });
}