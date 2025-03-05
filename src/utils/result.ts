export const RESULT_OK = "OK";
export const RESULT_NG = "NG";

interface OK<V> {
  readonly kind: typeof RESULT_OK;
  value: V;
}

interface NG<E> {
  readonly kind: typeof RESULT_NG;
  value: E;
}

export type Result<V, E> = OK<V> | NG<E>;

export const createResult = {
  ok: <T>(value: T): Result<T, never> => {
    return {
      kind: RESULT_OK,
      value,
    };
  },
  ng: <E>(value: E): Result<never, E> => {
    return {
      kind: RESULT_NG,
      value,
    };
  },
};
